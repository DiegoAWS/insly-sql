SELECT employee_name, birthname, is_current_employee, email, phone_number, address_employee, introduction, work_experience, education, language_name, created_at,created_by, updated_at, updated_by
FROM `employee_base_info` 
INNER JOIN `informations_about_employee` ON employee_base_info.id = informations_about_employee.employee_id 
INNER JOIN `languages` ON informations_about_employee.language_iso_code = languages.iso_code;
