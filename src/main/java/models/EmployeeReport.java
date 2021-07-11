package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import constants.JpaConst;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 日報データと従業員データの中間のDTOモデル
 *
 */
@Table(name = JpaConst.TABLE_REP_EMP)
@Getter //全てのクラスフィールドについてgetterを自動生成する(Lombok)
@Setter //全てのクラスフィールドについてsetterを自動生成する(Lombok)
@NoArgsConstructor //引数なしコンストラクタを自動生成する(Lombok)
@AllArgsConstructor //全てのクラスフィールドを引数にもつ引数ありコンストラクタを自動生成する(Lombok)
@Entity
public class EmployeeReport {
	
	/**
     * id
     */
    @Id
    @Column(name = JpaConst.REP_EMP_COL_ID)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    
    /**
     * 日報id
     */
    @Column(name = JpaConst.REP_EMP_COL_REP_ID, nullable = false)
    private Integer repId;
    
    /**
     * 従業員id
     */
    @Column(name = JpaConst.REP_EMP_COL_EMP_ID, nullable = false)
    private Integer empId;

}