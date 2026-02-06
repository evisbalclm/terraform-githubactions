resource "google_compute_instance" "vm_free_tier" {
  name         = "instancia-linux-privada"
  machine_type = "e2-micro" # Tipo de máquina de capa gratuita
  zone         = "us-central1-a" # Importante: Debe ser una zona de US para ser gratis

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11" # Linux ligero y estable
      size  = 30 # Máximo 30GB para mantenerse en la capa gratuita
    }
  }

  network_interface {
    network = "default"
    # AL NO PONER EL BLOQUE "access_config", LA VM NO TENDRÁ IP PÚBLICA
  }

  metadata = {
    enable-oslogin = "TRUE"
  }
}
