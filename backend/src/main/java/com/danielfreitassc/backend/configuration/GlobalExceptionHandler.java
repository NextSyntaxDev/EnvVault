package com.danielfreitassc.backend.configuration;

import java.util.stream.Collectors;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.server.ResponseStatusException;

import com.danielfreitassc.backend.dtos.MessageResponseDto;

@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(ResponseStatusException.class)
    public ResponseEntity<MessageResponseDto> handleResponseStatusException(ResponseStatusException ex) {
        String message = ex.getReason();
        HttpStatus status = HttpStatus.valueOf(ex.getStatusCode().value());

        MessageResponseDto messageResponseDto = new MessageResponseDto(message);
        return new ResponseEntity<>(messageResponseDto, status);
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<MessageResponseDto> handleMethodArgumentNotValidException(MethodArgumentNotValidException ex) {
        String errorMessage = ex.getBindingResult().getAllErrors().stream()
            .map(ObjectError::getDefaultMessage)
            .collect(Collectors.joining(", "));

        MessageResponseDto messageResponseDto = new MessageResponseDto(errorMessage);
        return new ResponseEntity<>(messageResponseDto, HttpStatus.BAD_REQUEST);
    }
}

