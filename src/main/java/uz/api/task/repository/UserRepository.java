package uz.api.task.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import uz.api.task.model.User;

public interface UserRepository extends JpaRepository<User, Long> {

}