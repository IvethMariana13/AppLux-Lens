using System.ComponentModel.DataAnnotations;

namespace Lux_Lens.Web.Models
{
    public class LensViewModel
    {
        public int Id { get; set; }
        public string Modelo { get; set; }
        public string Marca { get; set; }
        public string Color { get; set; }
        public string Material { get; set; }
        public decimal Precio { get; set; }
        public int Cantidad { get; set; }
    }
}
