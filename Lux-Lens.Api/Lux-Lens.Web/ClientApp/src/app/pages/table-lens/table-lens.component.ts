import { Component, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-table-lens',
  templateUrl: './table-lens.component.html',
  styleUrls: ['./table-lens.component.css'],
})


export class TableLensComponent {
  public forecasts: LensForecast[] = [];

  constructor(http: HttpClient) {
    http.get<LensForecast[]>('https://localhost:44326/api/Lens/GetAll').subscribe(result => {
      this.forecasts = result;
    }, error => console.error(error));
  }
}


interface LensForecast {
  id: number;
  modelo: string;
  marca: string;
  color: string;
  material: string;
  precio: number;
  cantidad: number;
}
