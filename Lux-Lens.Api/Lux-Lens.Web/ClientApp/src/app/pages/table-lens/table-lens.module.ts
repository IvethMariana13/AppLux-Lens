import { CommonModule } from "@angular/common";
import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { TableLensComponent } from "./table-lens.component";



const routes: Routes = [
  { path: '', component: TableLensComponent }
];

@NgModule({
  declarations: [
    TableLensComponent,
  ],
  imports: [
    CommonModule,
    
    RouterModule.forChild(routes)
  ]
})
export class TableLensModulte { }
