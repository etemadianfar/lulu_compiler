// Generated from D:/Intelli j/project\aaa.g4 by ANTLR 4.7.2
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link aaaParser}.
 */
public interface aaaListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link aaaParser#prog}.
	 * @param ctx the parse tree
	 */
	void enterProg(aaaParser.ProgContext ctx);
	/**
	 * Exit a parse tree produced by {@link aaaParser#prog}.
	 * @param ctx the parse tree
	 */
	void exitProg(aaaParser.ProgContext ctx);
	/**
	 * Enter a parse tree produced by {@link aaaParser#value}.
	 * @param ctx the parse tree
	 */
	void enterValue(aaaParser.ValueContext ctx);
	/**
	 * Exit a parse tree produced by {@link aaaParser#value}.
	 * @param ctx the parse tree
	 */
	void exitValue(aaaParser.ValueContext ctx);
}