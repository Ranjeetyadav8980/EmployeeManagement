package com.nt.model;

import java.time.LocalDateTime;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "rooms")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Room {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer roomId;

    @Column(unique = true, nullable = false)
    private String roomNumber;

    @Column(nullable = false)
    private String roomType;  // Single, Deluxe, Suite

    @Column(nullable = false)
    private String bedType;   // King, Queen, Twin

    private Integer floorNumber;

    @Column(nullable = false)
    private Double pricePerNight;

    @Column(nullable = false)
    private Integer capacity;

    @Column(nullable = false)
    private String status; // Available, Occupied, Maintenance

    private Boolean wifiAvailable;
    private Boolean acAvailable;
    private Boolean tvAvailable;
    private Boolean minibarAvailable;

    @Column(length = 500)
    private String description;

    private Boolean isActive = true;

    private LocalDateTime createdAt = LocalDateTime.now();
}
