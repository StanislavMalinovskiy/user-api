package uz.api.task.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import uz.api.task.model.User;
import uz.api.task.repository.UserRepository;

import java.util.ArrayList;
import java.util.List;

@CrossOrigin(origins = "http://localhost:8080")
@RestController
@RequestMapping("/api")
public class UserController {
    private final UserRepository userRepository;

    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    /**
     * Обрабатывает HTTP GET запросы "/user-info" для получения списка всех пользователей.
     *
     * @return ResponseEntity, содержит список пользователей и HTTP статус.
     * Если список пользователей не пуст, возвращает список и HTTP статус 200 (OK).
     * Если список пользователей пуст, возвращает HTTP статус 204 (No Content).
     */
    @GetMapping("/user-info")
    public ResponseEntity<List<User>> getAllUsers() {
        List<User> user = new ArrayList<>(userRepository.findAll());

        if (user.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }

        return new ResponseEntity<>(user, HttpStatus.OK);
    }

}