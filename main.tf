# Configure the Google Cloud provider
provider "google" {
  project = "ageless-runway-473613-f4" # Replace with your GCP project ID
  region  = "us-central1"    # Replace with your preferred region
}

# Create a storage bucket
resource "google_storage_bucket" "GCP_test_bucket" {
  name          = "example-bucket-name" # Must be globally unique
  location      = "US"                  # Multi-region location; options: EU, ASIA, or specific regions like us-central1
  storage_class = "STANDARD"            # Options: STANDARD, NEARLINE, COLDLINE, ARCHIVE

  # Optional: Enable versioning
  versioning {
    enabled = true
  }

  

  # Optional: Labels
  labels = {
    environment = "production1"
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
