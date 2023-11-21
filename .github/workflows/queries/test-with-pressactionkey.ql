/**
 * @description Find tests on pressActionKey
 * @kind problem
 * @id javascript/functions-over-ten-lines
 * @problem.severity recommendation
 */
import javascript

predicate isTest(InvokeExpr expression){
  expression.getCalleeName() = "it" and
  exists(InvokeExpr newExpression | newExpression.getCalleeName() = "describe" and expression.getParent*() = newExpression)
}

predicate namedPressActionKey(Function callee){
    callee.getName() = "pressActionKey"
}


from InvokeExpr test, Function callee
where isTest(test) and
      namedPressActionKey(callee)
select test, "calls pressActionKey"