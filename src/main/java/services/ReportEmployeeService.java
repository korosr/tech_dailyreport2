package services;

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

}
