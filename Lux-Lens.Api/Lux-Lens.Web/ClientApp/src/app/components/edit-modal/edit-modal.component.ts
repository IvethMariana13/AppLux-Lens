import { Component, Input, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { LensForecast } from 'src/app/pages/table-lens/table-lens.component';

@Component({
  selector: 'app-edit-modal',
  templateUrl: './edit-modal.component.html',
  styleUrls: ['./edit-modal.component.css']
})
export class EditModalComponent implements OnInit{
  @Input() id: number | undefined;
  public forecast!: LensForecast;

  constructor(public activeModal: NgbActiveModal, private http: HttpClient) { }

  ngOnInit(): void {
    this.obtenerDetallesParaEdicion();
    if (!this.id) {
      throw new Error('El id no está definido.');
    }
  }

  cancelar() {
    this.activeModal.close();
  }

  obtenerDetallesParaEdicion() {
    this.http.get<LensForecast>('https://localhost:44326/api/Lens/GetById/' + this.id).subscribe(result => {
      this.forecast = result;
    }, error => console.error(error));
  }

  guardarEdicion() {
    const editedData: LensForecast = {
      id: this.forecast.id,
      modelo: this.forecast.modelo,
      marca: this.forecast.marca,
      color: this.forecast.color,
      material: this.forecast.material,
      precio: this.forecast.precio,
      cantidad: this.forecast.cantidad
    };

    this.http.put('https://localhost:44326/api/Lens/Edit/' + this.id, editedData).subscribe(
      () => {
        this.activeModal.close('Editado exitosamente');
      },
      error => {
        console.error(error);
      }
    );
    location.reload();
    this.activeModal.close('Editado exitosamente');
  }
}
