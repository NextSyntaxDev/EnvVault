package com.danielfreitassc.backend.repositories;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import com.danielfreitassc.backend.models.UserEntity;

public interface UserQueryRepositoy extends JpaRepository<UserEntity, UUID> {
    Optional<UserEntity> findByUsername(String username);
    
    Optional<UserEntity> findFirstBy();
}
