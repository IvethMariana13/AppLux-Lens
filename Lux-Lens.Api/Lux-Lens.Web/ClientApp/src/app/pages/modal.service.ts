import { Injectable } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { CreateModalComponent } from 'src/app/components/create-modal/create-modal.component';
import { DeleteModalComponent } from 'src/app/components/delete-modal/delete-modal.component';
import { EditModalComponent } from 'src/app/components/edit-modal/edit-modal.component';

@Injectable({
  providedIn: 'root'
})
export class ModalService {

  constructor(private modalService: NgbModal) { }

  abrirModalAgregar() {
    const modalRef = this.modalService.open(CreateModalComponent);
  }

  abrirModalEditar(id: number) {
    const modalRef = this.modalService.open(EditModalComponent);
    modalRef.componentInstance.id = id; // Pasar el id al componente de edición
  }
}
