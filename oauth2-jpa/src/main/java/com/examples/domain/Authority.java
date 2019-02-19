package com.examples.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;
import java.io.Serializable;

@Getter
@NoArgsConstructor
@Entity
@Table(name = "authorities")
public class Authority implements GrantedAuthority, Serializable {

    private static final long serialVersionUID = -5975835326509963502L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String authority;

    public Authority(String authority) {
        this.authority = authority;
    }
}