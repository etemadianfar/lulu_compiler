// Generated from D:/Intelli j/project\aaa.g4 by ANTLR 4.7.2
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link aaaParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface aaaVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link aaaParser#prog}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProg(aaaParser.ProgContext ctx);
	/**
	 * Visit a parse tree produced by {@link aaaParser#value}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitValue(aaaParser.ValueContext ctx);
}