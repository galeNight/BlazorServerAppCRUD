using core___blazer.Data;
using core___blazer.Data.Models;
using Microsoft.EntityFrameworkCore;

namespace core___blazer.Services
{
    public class CustomerService
    {
        private IDbContextFactory<DemoDbContext> _dbContextFactory;

        public CustomerService(IDbContextFactory<DemoDbContext> dbContextFactory)
        {
            _dbContextFactory = dbContextFactory;
        }
        public void AddCustomer(Customer customer)
        {
            using(var context = _dbContextFactory.CreateDbContext())
            {
                context.Customers.Add(customer);
            }
        }
    }
}
