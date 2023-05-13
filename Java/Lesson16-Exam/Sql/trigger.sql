-- insert user (project)
DROP TRIGGER IF EXISTS INSERT_USER;
DELIMITER $$
	CREATE TRIGGER INSERT_USER
    BEFORE INSERT ON `user`
    FOR EACH ROW
    BEGIN
		DECLARE old_member_size TINYINT;
		DECLARE old_department_id TINYINT;

    -- project tang so luong member_size    
        SELECT member_size INTO old_member_size
        FROM project
        WHERE id = NEW.project_id;
    
		UPDATE project
        SET member_size = (old_member_size + 1)
        WHERE id = NEW.project_id;
        
    -- department tang so luong member_size
        SELECT member_size INTO old_department_id
        FROM department
        WHERE id = NEW.department_id;
    
		UPDATE department
        SET member_size = (old_department_id + 1)
        WHERE id = NEW.department_id;
    
    END $$
DELIMITER ;

-- update user (project)
DROP TRIGGER IF EXISTS update_user;
DELIMITER $$
	CREATE TRIGGER update_user
	BEFORE UPDATE ON `user`
	FOR EACH ROW
		BEGIN
			DECLARE old_member_size TINYINT;
			DECLARE old_department_id TINYINT;
            
        -- project
            -- tang so luong project mơi
			SELECT member_size INTO old_member_size
			FROM project
			WHERE id = NEW.project_id;
    
			UPDATE project
			SET member_size = (old_member_size + 1)
			WHERE id = NEW.project_id;
			
              -- giam so luong cua project cu
			SELECT member_size INTO old_member_size
			FROM project
			WHERE id = OLD.project_id;
    
			UPDATE project
			SET member_size = (old_member_size - 1)
			WHERE id = OLD.project_id;
            
		-- department
			-- tang so luong
			SELECT member_size INTO old_department_id
			FROM department
			WHERE id = NEW.department_id;
    
			UPDATE department
			SET member_size = (old_department_id + 1)
			WHERE id = NEW.department_id;
			
              -- giam so luong cua project cu
			SELECT member_size INTO old_department_id
			FROM department
			WHERE id = OLD.department_id;
    
			UPDATE department
			SET member_size = (old_department_id - 1)
			WHERE id = OLD.department_id;
	END $$
DELIMITER ;

-- delete user (project)
DROP TRIGGER IF EXISTS delete_user;
DELIMITER $$
CREATE TRIGGER delete_user

BEFORE DELETE ON `user`
FOR EACH ROW
	BEGIN
			DECLARE old_member_size TINYINT;
			DECLARE old_department_id TINYINT;
            
		  -- project giam so luong
			SELECT member_size INTO old_member_size
			FROM project
			WHERE id = OLD.project_id;
    
			UPDATE project
			SET member_size = (old_member_size - 1)
			WHERE id = OLD.project_id;
            
		-- department giam so luong
			SELECT member_size INTO old_department_id
			FROM department
			WHERE id = OLD.department_id;
    
			UPDATE department
			SET member_size = (old_department_id - 1)
			WHERE id = OLD.department_id;
	END $$
/*    
-- update project
DROP TRIGGER IF EXISTS update_project;
DELIMITER $$
	CREATE TRIGGER update_project
	BEFORE UPDATE ON project
	FOR EACH ROW
		BEGIN
        UPDATE project
        SET member_size = member_size + 1
        WHERE manager_id = NEW.manager_id;
        
	END $$
*/    