CREATE OR REPLACE PACKAGE BODY pkg_error_log IS

  PROCEDURE error_log(p_error_message VARCHAR2
                   ,p_error_value   VARCHAR2
                   ,p_api         VARCHAR2) IS
    PRAGMA AUTONOMOUS_TRANSACTION;
  BEGIN
    INSERT INTO error_log
      (error_id
      ,error_time
      ,error_message
      ,error_value
      ,api)
    VALUES
      (error_log_seq.nextval
      ,sysdate
      ,p_error_message
      ,p_error_value
      ,p_api);
  
    COMMIT;
  END error_log;

END pkg_error_log;
