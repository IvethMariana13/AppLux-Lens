import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LuxLensComponent } from './lux-lens.component';

describe('LuxLensComponent', () => {
  let component: LuxLensComponent;
  let fixture: ComponentFixture<LuxLensComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [LuxLensComponent]
    });
    fixture = TestBed.createComponent(LuxLensComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
