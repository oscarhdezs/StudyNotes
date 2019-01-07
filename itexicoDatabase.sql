if (roles != null) {
			for (int x = 0; x < roles.size(); x++) {
				user.getRoles().get(x).setActive(roles.get(x).getActive());
				user.getRoles().get(x).setRoleName(roles.get(x).getRoleName());
			}
			needToUpdate = true;
		}

Script database
use itexico;

DROP TABLE IF EXISTS user;
CREATE TABLE user (
  user_id  INT(11) NOT NULL  UNIQUE AUTO_INCREMENT,
  first_name VARCHAR(100)  NOT NULL UNIQUE,
  last_name VARCHAR(100)  NOT NULL,
  creation_date  DATE NOT NULL,
  active BOOLEAN NOT NULL,
  PRIMARY KEY(user_id)
  );
  
 DROP TABLE IF EXISTS role;
  CREATE TABLE role(
  role_id INT(11) NOT NULL  AUTO_INCREMENT,
  role_name VARCHAR(20) UNIQUE NOT NULL,
  active BOOLEAN NOT NULL,
  PRIMARY KEY (role_id)
  );

  
  DROP TABLE IF EXISTS user_roles;
  CREATE TABLE user_roles(
  user_id INT(11),
  role_id INT(11),
  PRIMARY KEY(user_id,role_id),
  CONSTRAINT FK_USER
  FOREIGN KEY (user_id)
  REFERENCES user(user_id)
  ON DELETE NO ACTION ON UPDATE NO ACTION, 
  
  CONSTRAINT FK_ROLE
  FOREIGN KEY (role_id)
  REFERENCES role(role_id)
  ON DELETE NO ACTION ON UPDATE NO ACTION
  );
