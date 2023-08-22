import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ModalService } from 'src/app/pages/modal.service'

@Component({
  selector: 'app-table-lens',
  templateUrl: './table-lens.component.html',
  styleUrls: ['./table-lens.component.css'],
})


export class TableLensComponent implements OnInit {
  public forecasts: LensForecast[] = [];
  public searchInput: string = '';

  constructor(private http: HttpClient, private modalService: ModalService) { }


    ngOnInit(): void {
      this.getAll();
  }



  getAll() {
    this.http.get<LensForecast[]>('https://localhost:7080/api/Lens/GetAll').subscribe(result => {
      this.forecasts = result;
    }, error => console.error(error));
  }


  borrarRegistro(id: number) {
    this.http.delete('https://localhost:7080/api/Lens/Delete/' + id).subscribe(error => console.error(error));
    location.reload();
  }

  abrirModalAgregar() {
    this.modalService.abrirModalAgregar();
  }

  abrirModalEditar(id: number) {
    this.modalService.abrirModalEditar(id);
  }
}


export interface LensForecast {
  id: number;
  modelo: string;
  marca: string;
  color: string;
  material: string;
  precio: number;
  cantidad: number;
}
