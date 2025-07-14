package com.example.SupportTicket.Model;



import jakarta.persistence.*;

@Entity
@Table(name = "tickets")
public class TicketModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column
    private String subject;

    @Column
    private String description;

    @Column
    private String status;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private UserModel user;

    public TicketModel() {
    }

    public TicketModel(int id, String subject, String description, String status, UserModel user) {
        this.id = id;
        this.subject = subject;
        this.description = description;
        this.status = status;
        this.user = user;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getSubject() { return subject; }
    public void setSubject(String subject) { this.subject = subject; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public UserModel getUser() { return user; }
    public void setUser(UserModel user) { this.user = user; }

    @Override
    public String toString() {
        return "TicketModel [id=" + id + ", subject=" + subject + ", status=" + status + ", user=" + user.getName() + "]";
    }
}
