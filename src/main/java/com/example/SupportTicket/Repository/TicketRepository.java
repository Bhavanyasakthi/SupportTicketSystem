package com.example.SupportTicket.Repository;



import com.example.SupportTicket.Model.TicketModel;
import com.example.SupportTicket.Model.UserModel;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface TicketRepository extends JpaRepository<TicketModel, Integer> {

    // Get tickets created by a specific user
    List<TicketModel> findByUser(UserModel user);
}

