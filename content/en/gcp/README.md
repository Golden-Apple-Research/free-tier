# Google Cloud — Auth fer Terraform

> Preferred: **`gcloud auth application-default login`** (user credentials)
> locally, **service account** fer CI — the google provider reads the
> Application Default Credentials (ADC) automatically. It sniffs out yer
> papers like a well-trained first mate.

## 1. Plunder a Credential

**Option A — User login via ADC (recommended, local):**

```bash
gcloud auth login                        # login for gcloud itself
gcloud auth application-default login    # login FOR TERRAFORM/SDKs (important!)
gcloud config set project my-free-project
```

Two logins — one fer the ship's wheel, one fer the tools below deck. Don't
skip the second, or Terraform'll stare at ye like a landlubber what lost
his bearings. Many a fine swab has run aground on this very rock — they
logs in once, feels captainly, an' wonders why the tools below deck see
him not. Two keys, two locks; turn 'em both.

**Option B — Service account (CI):**
Console → IAM & Admin → Service Accounts → Create → *Keys* →
*Add key* → create JSON (one-time download). A set o' papers fer a
robotic deckhand — downloaded once, guarded like gold.

**Option C — CI without a key file:** Workload Identity Federation
(GitHub Actions: `google-github-actions/auth` with OIDC) — no JSON file.
No file to lose overboard. The machines swear fealty to each other
directly — no parchment, no ink, no theft.

## 2. Hook it into Terraform

```bash
export GOOGLE_APPLICATION_CREDENTIALS="/path/to/sa-key.json"  # option B only
# Option A: nothing needed
```

```hcl
provider "google" {
  project = "my-free-project"
  region  = "us-central1" # Always Free region!
}
```

## 3. Notes

- The Free Trial/$300 credit still needs a **billing account** on the
  project — otherwise many services (Cloud Run & co.) refuse to be created.
  Aye, the free rum flows — but ye must show the tavern a tab first.
- The service-account JSON be a full key; if leaked, deactivate it in IAM
  immediately. Fer production, prefer Workload Identity. A leaked key be a
  treasure map in enemy hands — burn the map, change the lock.
- **Decide the region before auth:** Always Free only in us-west1/us-central1/
  us-east1 (see TERRAFORM.md) — set `region`/`zone` dutifully. And ye bloody
  landrat really thought ye had to pay fer it? Nay — but only in the three
  blessed regions, mind ye. Set sail fer the free waters, or the bill
  kraken rises. That's not what you expected, eh? Aye, three safe harbors
  an' the rest be shark-infested.

## Sources

- Provider auth: <https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference>
- ADC: <https://cloud.google.com/docs/authentication/provide-credentials-adc>
