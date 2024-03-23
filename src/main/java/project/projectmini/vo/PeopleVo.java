package project.projectmini.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PeopleVo {
    int p_idx;
    String p_name;
    String p_email;
    String p_personal;
    String p_pwd;
    String p_prefer;
    String p_phone;

    // Method to process the resident registration number
    public void processPersonal() {
        if (p_personal != null && p_personal.length() == 13) {
            p_personal = p_personal.substring(0, 6) + "-" + "*******"; // Replace last 7 digits with asterisks
        }
    }

    public void processPassword() {
        if (p_pwd != null && !p_pwd.isEmpty()) {
            StringBuilder maskedPassword = new StringBuilder();
            for (int i = 0; i < p_pwd.length(); i++) {
                maskedPassword.append("*");
            }
            p_pwd = maskedPassword.toString();
        }
    }
    
}