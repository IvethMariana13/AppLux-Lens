using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lux_Lens.AppServices.Shared.Dto
{
    public class LensDto
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

