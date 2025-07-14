package com.example.SupportTicket.Controller;

import com.example.SupportTicket.Model.TicketModel;
import com.example.SupportTicket.Repository.TicketRepository;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class AdminController {

    private static final String ADMIN_EMAIL = "admin@example.com";
    private static final String ADMIN_PASSWORD = "admin123";

    @Autowired
    private TicketRepository ticketRepository;

    // Show admin login page
    @GetMapping("/admin")
    public String showAdminLoginPage() {
        return "adminLogin";
    }

    // Process admin login
    @PostMapping("/admin")
    public String processAdminLogin(HttpServletRequest request,
                                    @RequestParam String email,
                                    @RequestParam String password,
                                    Model model) {
        if (ADMIN_EMAIL.equals(email) && ADMIN_PASSWORD.equals(password)) {
            request.getSession().setAttribute("isAdmin", true);
            return "redirect:/admin/tickets";
        } else {
            model.addAttribute("error", "Invalid admin credentials");
            return "adminLogin";
        }
    }

    // View all tickets
    @GetMapping("/admin/tickets")
    public String viewAllTickets(HttpServletRequest request, Model model) {
        if (request.getSession().getAttribute("isAdmin") == null) {
            return "redirect:/admin";
        }

        List<TicketModel> allTickets = ticketRepository.findAll();
        model.addAttribute("tickets", allTickets);
        return "adminTicketList";
    }

    // Update ticket status
    @PostMapping("/admin/tickets/update")
    public String updateTicketStatus(@RequestParam int ticketId,
                                     @RequestParam String status) {
        TicketModel ticket = ticketRepository.findById(ticketId).orElse(null);
        if (ticket != null) {
            ticket.setStatus(status);
            ticketRepository.save(ticket);
        }
        return "redirect:/admin/tickets";
    }

    // Logout
    @GetMapping("/admin/logout")
    public String logoutAdmin(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/admin";
    }
}
