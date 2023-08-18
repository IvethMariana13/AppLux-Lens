using Lux_Lens.Core.Entities;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lux_Lens.DataAccess
{
    public class DbContext : IdentityDbContext
    {
        public virtual DbSet<Lens> Lens { get; set; }
        public DbContext(DbContextOptions <DbContext> options) : base(options)
        {

        }
    }
}
