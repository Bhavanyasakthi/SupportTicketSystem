/*package com.example.SupportTicket.Repository;


import com.example.SupportTicket.Model.UserModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<UserModel, Integer> {

    // Custom finder method to validate login
    
	UserModel findByEmailAndPassword(String email, String password);
}
*/
package com.example.SupportTicket.Repository;

import com.example.SupportTicket.Model.UserModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<UserModel, Integer> {

    // For login validation
    UserModel findByEmailAndPassword(String email, String password);

    // For checking email uniqueness during registration
    UserModel findByEmail(String email);
}
