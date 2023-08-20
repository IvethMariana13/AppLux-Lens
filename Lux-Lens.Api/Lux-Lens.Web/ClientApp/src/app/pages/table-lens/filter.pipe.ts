import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'filter'
})
export class FilterPipe implements PipeTransform {
  transform(items: any[], searchText: string): any[] {
    if (!items) {
      return [];
    }
    if (!searchText) {
      return items;
    }
    searchText = searchText.toLowerCase();
    return items.filter(item => {
      return item.modelo.toLowerCase().includes(searchText) ||
        item.marca.toLowerCase().includes(searchText) ||
        item.color.toLowerCase().includes(searchText) ||
        item.material.toLowerCase().includes(searchText) ||
        item.precio.toString().includes(searchText) ||
        item.cantidad.toString().includes(searchText);
    });
  }
}
