using BlazorServerAppCRUD.Models;
using BlazorServerAppCRUD.Repositories;

namespace BlazorServerAppCRUD.Services
{
    public class UserServices : IUserServices
    {
        private readonly IUserRepository repository;

        public UserServices(IUserRepository _repository)
        {
            repository = _repository;
        }
        public bool AddUser(UserEntity user)
        {
            try
            {
                repository.AddUser(user);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool DeleteUser(int? Id)
        {
            try
            {
                repository.DeleteUser(Id);
                return true;

            }
            catch (Exception)
            {

                return false;
            }
        }

        public IEnumerable<UserEntity> GetAllUsers()
        {
            List<UserEntity> users = new List<UserEntity>();

            users = repository.GetAllUsers().ToList();

            return users;
        }

        public bool UpdateUser(UserEntity user)
        {
            try
            {
                repository.UpdateUser(user);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}
