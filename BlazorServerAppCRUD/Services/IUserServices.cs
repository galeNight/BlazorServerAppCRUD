using BlazorServerAppCRUD.Models;

namespace BlazorServerAppCRUD.Services
{
    public interface IUserServices
    {
        public IEnumerable<UserEntity> GetAllUsers();

        public bool AddUser(UserEntity student);

        public bool UpdateUser(UserEntity student);

        public bool DeleteUser(int? Id);
    }
}
