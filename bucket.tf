resource "google_storage_bucket" "mi_bucket_destino" {
  name          = "bucket-linux-debian6969" # Cambia esto por un nombre único
  location      = "US" # Capa gratuita disponible en US
  force_destroy = true

  uniform_bucket_level_access = true
}

resource "google_storage_bucket_iam_member" "permiso_vm_bucket" {
  bucket = google_storage_bucket.mi_bucket_destino.name
  role   = "roles/storage.objectAdmin"
  member = "github-actions-sa@project-271e1e87-2307-44b8-a02.iam.gserviceaccount.com" 
  # Nota: Verifica en tu consola que ese sea el correo de tu "Compute Engine default service account"
}
