package services;

import constants.JpaConst;
import models.EmployeeReport;

/**
 * 日報_従業員中間テーブルの操作に関わる処理を行うクラス
 */
public class ReportEmployeeService extends ServiceBase {
	
    /**
     * 日報_従業員データを1件登録する
     * @param er 日報_従業員データ
     */
    public void create(EmployeeReport er) {

        em.getTransaction().begin();
        em.persist(er);
        em.getTransaction().commit();

    }
    
    /**
     * 社員IDとレポートIDを条件に該当するデータの件数を取得し、返却する
     * @param code 社員番号
     * @return 該当するデータの件数
     */
    public long countByEmpRep(int empId, int repId) {
        //社員IDとレポートIDを条件に該当するデータの件数を取得する
        long emp_rep_count = (long) em.createNamedQuery(JpaConst.Q_REP_EMP_COUNT, Long.class)
        		.setParameter(JpaConst.JPQL_PARM_REPORT_ID, repId)
                .setParameter(JpaConst.JPQL_PARM_EMPLOYEE_ID, empId)
                .getSingleResult();
        return emp_rep_count;
    }
    
    /**
     * EmployeeReportのインスタンスで返却する
     * @param empId
     * @param repId
     * @return 取得データのインスタンス
     */
    public EmployeeReport getByEmpRep(int empId, int repId) {
        //社員IDとレポートIDを条件に該当するデータを取得する
    	EmployeeReport er = em.createNamedQuery(JpaConst.Q_REP_EMP_GET_MINE, EmployeeReport.class)
        		.setParameter(JpaConst.JPQL_PARM_REPORT_ID, repId)
                .setParameter(JpaConst.JPQL_PARM_EMPLOYEE_ID, empId)
                .getSingleResult();
        return er;
    }
    
    /**
     * EmployeeReportのインスタンスを削除する
     * @param empId
     * @param repId
     * @return 取得データのインスタンス
     */
    public void deleteByEmpRep(EmployeeReport er) {
    	em.getTransaction().begin();
        em.remove(er);
        em.getTransaction().commit();
    }
}
