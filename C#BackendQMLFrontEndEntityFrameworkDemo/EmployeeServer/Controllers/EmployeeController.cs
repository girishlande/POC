using EmployeeDemo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace EmployeeDemo.Controllers
{
    public class EmployeeController : ApiController
    {
        EmployeeDbContext ctx = new EmployeeDbContext();

        public IEnumerable<Employee> Get()
        {
            return ctx.Employees;
        }

        public Employee Get(int id)
        {
            foreach(var v in ctx.Employees)
            {
                if (v.EmpId == id)
                    return v;
            }
            return new Employee() { EmpId = -1, EmpName = "NA", EmpCity = "NA" };
        }

        public void Post(Employee emp)
        {
            ctx.Employees.Add(emp);
            ctx.SaveChanges();
        }

        public void Put(int id,Employee emp)
        {
            Employee e = ctx.Employees.Find(id);
            if (e != null)
            {
                e.EmpCity = emp.EmpCity;
                e.EmpName = emp.EmpName;
                ctx.SaveChanges();
            }
        }

        public void Delete(int id)
        {
            Employee e = ctx.Employees.Find(id);
            if (e !=null)
            {
                ctx.Employees.Remove(e);
                ctx.SaveChanges();
            }
        }

    }
}
