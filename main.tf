# Configure the Google Cloud provider
provider "google" {
  project = "ageless-runway-473613-f4" # Replace with your GCP project ID
  region  = "us-central1"    # Replace with your preferred region
}

# Create a storage bucket
resource "google_storage_bucket" "example" {
  name          = "example-bucket-name" # Must be globally unique
  location      = "US"                  # Multi-region location; options: EU, ASIA, or specific regions like us-central1
  storage_class = "STANDARD"            # Options: STANDARD, NEARLINE, COLDLINE, ARCHIVE

  # Optional: Enable versioning
  versioning {
    enabled = true
  }

  # Optional: Set bucket access control (uniform bucket-level access)
  uniform_bucket_level_access = true

  # Optional: Labels
  labels = {
    environment = "production"
  }

  # Optional: Lifecycle rule to transition objects to a different storage class
  lifecycle_rule {
    condition {
      age = 3 # Days
    }
    action {
      type = "SetStorageClass"
      storage_class = "NEARLINE"
    }
  }
}
