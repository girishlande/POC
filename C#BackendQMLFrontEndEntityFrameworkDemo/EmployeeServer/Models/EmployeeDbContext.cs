using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace EmployeeDemo.Models
{
    public class EmployeeDbContext : DbContext
    {
        public EmployeeDbContext()
            :base()
        {
        }

        public DbSet<Employee> Employees { get; set; }
    }
}