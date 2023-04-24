using BlazorServerAppCRUD.Models;

namespace BlazorServerAppCRUD.Repositories
{
    public interface IUserRepository
    {
        public IEnumerable<UserEntity> GetAllUsers();

        public bool AddUser(UserEntity user);

        public bool UpdateUser(UserEntity user);

        public bool DeleteUser(int? Id);
    }
}
