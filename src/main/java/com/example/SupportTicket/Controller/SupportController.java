/*
package com.example.SupportTicket.Controller;

import com.example.SupportTicket.Model.UserModel;
import com.example.SupportTicket.Repository.UserRepository;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class SupportController {

    @Autowired
    private UserRepository userRepository;

    // ✅ SHOW LOGIN PAGE
    @GetMapping("/login")
    public String showLoginPage() {
        return "login"; // maps to login.jsp
    }

    // ✅ PROCESS LOGIN FORM
    @PostMapping("/login")
    public String processLogin(HttpServletRequest request) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserModel user = userRepository.findByEmailAndPassword(email, password);

        if (user != null) {
            request.getSession().setAttribute("loggedUser", user);
            return "redirect:/home";
        } else {
            request.setAttribute("error", "Invalid email or password");
            return "login";
        }
    }

    // ✅ SHOW REGISTER PAGE
    @GetMapping("/register")
    public String showRegisterPage() {
        return "register"; // maps to register.jsp
    }

    // ✅ PROCESS REGISTRATION FORM
    @PostMapping("/register")
    public String processRegister(@RequestParam String name,
                                  @RequestParam String email,
                                  @RequestParam String password,
                                  HttpServletRequest request) {

        if (userRepository.findByEmail(email) != null) {
            request.setAttribute("message", "Email already exists");
            request.setAttribute("status", "error");
            return "register";
        }

        UserModel newUser = new UserModel();
        newUser.setName(name);
        newUser.setEmail(email);
        newUser.setPassword(password);
        userRepository.save(newUser);

        request.setAttribute("message", "Registration successful! Please login.");
        request.setAttribute("status", "success");
        return "register";
    }

    // ✅ HOME PAGE AFTER LOGIN
    @GetMapping("/home")
    public String homePage() {
        return "home";  // create home.jsp or redirect to /login
    }
}
*/

package com.example.SupportTicket.Controller;

import com.example.SupportTicket.Model.TicketModel;
import com.example.SupportTicket.Model.UserModel;
import com.example.SupportTicket.Repository.TicketRepository;
import com.example.SupportTicket.Repository.UserRepository;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class SupportController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private TicketRepository ticketRepository;

    // ✅ SHOW LOGIN PAGE
    @GetMapping("/login")
    public String showLoginPage() {
        return "login"; // maps to login.jsp
    }

    // ✅ PROCESS LOGIN FORM
    @PostMapping("/login")
    public String processLogin(HttpServletRequest request) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserModel user = userRepository.findByEmailAndPassword(email, password);

        if (user != null) {
            request.getSession().setAttribute("loggedUser", user);
            return "redirect:/home";
        } else {
            request.setAttribute("error", "Invalid email or password");
            return "login";
        }
    }
    @GetMapping("/")
    public String welcomePage() {
        return "welcome"; // maps to welcome.jsp
    }


    // ✅ SHOW REGISTER PAGE
    @GetMapping("/register")
    public String showRegisterPage() {
        return "register";
    }

    // ✅ PROCESS REGISTRATION FORM
    @PostMapping("/register")
    public String processRegister(@RequestParam String name,
                                  @RequestParam String email,
                                  @RequestParam String password,
                                  HttpServletRequest request) {

        if (userRepository.findByEmail(email) != null) {
            request.setAttribute("message", "Email already exists");
            request.setAttribute("status", "error");
            return "register";
        }

        UserModel newUser = new UserModel();
        newUser.setName(name);
        newUser.setEmail(email);
        newUser.setPassword(password);
        userRepository.save(newUser);

        request.setAttribute("message", "Registration successful! Please login.");
        request.setAttribute("status", "success");
        return "register";
    }

    // ✅ HOME PAGE
    @GetMapping("/home")
    public String homePage() {
        return "home";  // create home.jsp
    }

    // ✅ SHOW TICKET FORM
    @GetMapping("/create-ticket")
    public String showCreateTicketForm() {
        return "createTicket"; // create createTicket.jsp
    }

    // ✅ SUBMIT TICKET
    @PostMapping("/create-ticket")
    public String submitTicket(HttpServletRequest request) {
        String subject = request.getParameter("subject");
        String description = request.getParameter("description");

        UserModel loggedUser = (UserModel) request.getSession().getAttribute("loggedUser");
        if (loggedUser == null) {
            return "redirect:/login";
        }

        TicketModel ticket = new TicketModel();
        ticket.setSubject(subject);
        ticket.setDescription(description);
        ticket.setStatus("Open");
        ticket.setUser(loggedUser);

        ticketRepository.save(ticket);
        return "redirect:/tickets";
    }

    // ✅ VIEW USER TICKETS
    @GetMapping("/tickets")
    public String viewTickets(HttpServletRequest request, Model model) {
        UserModel loggedUser = (UserModel) request.getSession().getAttribute("loggedUser");
        if (loggedUser == null) {
            return "redirect:/login";
        }

        List<TicketModel> tickets = ticketRepository.findByUser(loggedUser);
        model.addAttribute("tickets", tickets);
        return "ticketList"; // create ticketList.jsp
    }
    
    @GetMapping("/ticket/delete/{id}")
    public String deleteTicket(@PathVariable("id") int id, HttpServletRequest request) {
        UserModel loggedUser = (UserModel) request.getSession().getAttribute("loggedUser");

        // Optional: Ensure the ticket belongs to the logged-in user
        TicketModel ticket = ticketRepository.findById(id).orElse(null);
        if (ticket != null && ticket.getUser().getId() == loggedUser.getId()) {
            ticketRepository.delete(ticket);
        }

        return "redirect:/tickets";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().invalidate(); // Clear the session
        return "redirect:/login";         // Redirect to login.jsp
    }

}
