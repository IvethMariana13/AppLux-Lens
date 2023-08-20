import { CommonModule } from "@angular/common";
import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { TableLensComponent } from "./table-lens.component";
import { FormsModule } from "@angular/forms"
import { FilterPipe } from './filter.pipe';



const routes: Routes = [
  { path: '', component: TableLensComponent }
];

@NgModule({
  declarations: [
    TableLensComponent,
    FilterPipe
  ],
  imports: [
    CommonModule,
    FormsModule,
    RouterModule.forChild(routes)
  ]
})
export class TableLensModulte { }
