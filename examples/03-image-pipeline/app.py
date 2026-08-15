"""Bild-Pipeline: Thumbnails erzeugen und Metadaten in Supabase speichern.

Dies ist die Modal-Seite des Beispiels — bewusst als Python-SDK-App statt
Terraform-Ressource (vgl. ../../modal/TERRAFORM.md: Apps/Functions gehören
dem SDK, TF verwaltet die Account-Objekte drumherum).

Einmaliges Setup des Supabase-Secrets (Werte aus `terraform output`):

    modal secret create supabase \
        SUPABASE_URL=$(terraform output -raw supabase_url) \
        SUPABASE_SERVICE_ROLE_KEY=$(terraform output -raw supabase_service_role_key)

Deploy (lokal oder aus CircleCI, siehe .circleci/config.yml):

    modal deploy app.py
"""

import io
import os

import modal

app = modal.App("image-pipeline")

image = (
    modal.Image.debian_slim(python_version="3.12")
    .pip_install("httpx", "Pillow", "supabase")
    .add_local_python_source("app")  # eigene Module mitgeben, falls vorhanden
)


@app.function(
    image=image,
    secrets=[modal.Secret.from_name("supabase")],  # oben einmalig angelegt
    timeout=120,
)
def make_thumbnail(image_url: str) -> dict:
    """Lädt ein Bild, erzeugt ein 256×256-Thumbnail und loggt die Metadaten."""
    import httpx  # Imports bewusst in der Funktion: schnellere Cold Starts
    from PIL import Image
    from supabase import create_client

    # 1) Bild laden
    raw = httpx.get(image_url, timeout=30.0).content
    img = Image.open(io.BytesIO(raw)).convert("RGB")

    # 2) Thumbnail erzeugen (hier: verwerfen — Storage-Upload wäre der nächste
    #    Schritt, z. B. in den R2-Bucket aus Beispiel 01)
    img.thumbnail((256, 256))
    buf = io.BytesIO()
    img.save(buf, format="JPEG", quality=80)

    # 3) Metadaten in Supabase schreiben (service_role umgeht RLS!)
    db = create_client(
        os.environ["SUPABASE_URL"],
        os.environ["SUPABASE_SERVICE_ROLE_KEY"],
    )
    result = (
        db.table("thumbnails")
        .insert(
            {
                "source_url": image_url,
                "width": img.width,
                "height": img.height,
                "bytes": buf.getbuffer().nbytes,
            }
        )
        .execute()
    )
    return result.data[0]


@app.local_entrypoint()
def main(url: str = "https://picsum.photos/1200/900"):
    """Lokaler Test-Runner: `modal run app.py --url <bild-url>`"""
    print(make_thumbnail.remote(url))
