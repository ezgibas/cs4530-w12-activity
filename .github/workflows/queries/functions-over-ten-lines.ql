/**
 * @description Find functions over ten lines
 * @kind problem
 * @id javascript/functions-over-ten-lines
 * @problem.severity recommendation
 */
import javascript

predicate overTenLines(Function function) {
  function.getNumLines() > 10
}

from Function func
where overTenLines(func)
select func, "is over ten lines"