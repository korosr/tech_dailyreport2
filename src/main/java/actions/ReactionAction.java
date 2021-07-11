package actions;

import java.io.IOException;

import javax.servlet.ServletException;

import action.views.EmployeeView;
import constants.AttributeConst;
import constants.ForwardConst;
import models.EmployeeReport;
import services.ReportEmployeeService;

/**
 * リアクションに関する処理を行うActionクラス
 *
 */
public class ReactionAction extends ActionBase{

	private ReportEmployeeService service;

	/**
	 * メソッドを実行する
	 */
	@Override
	public void process() throws ServletException, IOException {

		service = new ReportEmployeeService();

		//メソッドを実行
		invoke();
		service.close();
	}

	/**
	 * 新規登録を行う
	 * @throws ServletException
	 * @throws IOException
	 */
	public void create() throws ServletException, IOException {
		//CSRF対策 tokenのチェック
		if (checkToken()) {
			//セッションからログイン中の従業員情報を取得
			EmployeeView ev = (EmployeeView) getSessionScope(AttributeConst.LOGIN_EMP);

			//パラメータの値を元にレポートID取得
			String repId = getRequestParam(AttributeConst.REP_ID);
			//パラメータの値をもとに日報＿従業員情報(model)のインスタンスを作成する
			EmployeeReport er = new EmployeeReport(null, ev.getId(), Integer.parseInt(repId));
	
			//日報＿従業員情報登録
			service.create(er);
						
			//一覧画面にリダイレクト
			redirectAddId(ForwardConst.ACT_REP, ForwardConst.CMD_SHOW, repId);
		}
	}

}
