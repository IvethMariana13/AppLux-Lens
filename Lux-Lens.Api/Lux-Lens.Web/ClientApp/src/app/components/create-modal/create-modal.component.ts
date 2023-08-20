import { Component, Input, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-create-modal',
  templateUrl: './create-modal.component.html',
  styleUrls: ['./create-modal.component.css']
})
export class CreateModalComponent {
  @Input() id: number | undefined;
  public forecast: LensForecast = {
    modelo: '',
    marca: '',
    color: '',
    material: '',
    precio: 0,
    cantidad: 0
  };

  constructor(public activeModal: NgbActiveModal, private http: HttpClient) { }

  guardarDatos() {
    const data: LensForecast = {
      modelo: this.forecast.modelo,
      marca: this.forecast.marca,
      color: this.forecast.color,
      material: this.forecast.material,
      precio: this.forecast.precio,
      cantidad: this.forecast.cantidad
    };

    this.http.post('https://localhost:44326/api/Lens/Create', data).subscribe(
      () => {
        this.activeModal.close('Creado exitosamente');
      },
      error => {
        console.error(error);
      }
    );

    location.reload();
    this.activeModal.close('Creado exitosamente');
  }
}

interface LensForecast {
  modelo: string;
  marca: string;
  color: string;
  material: string;
  precio: number;
  cantidad: number;
}
