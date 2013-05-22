%{
#include "expr/expr.h"

#ifdef SWIGJAVA

#include "bindings/java_iterator_adapter.h"
#include "bindings/java_stream_adapters.h"

#endif /* SWIGJAVA */
%}

#ifdef SWIGPYTHON
%rename(doApply) CVC4::ExprHashFunction::operator()(CVC4::Expr) const;
#else /* SWIGPYTHON */
%rename(apply) CVC4::ExprHashFunction::operator()(CVC4::Expr) const;
#endif /* SWIGPYTHON */

%ignore CVC4::operator<<(std::ostream&, const Expr&);
%ignore CVC4::operator<<(std::ostream&, const TypeCheckingException&);

%ignore CVC4::expr::operator<<(std::ostream&, ExprSetDepth);
%ignore CVC4::expr::operator<<(std::ostream&, ExprPrintTypes);
%ignore CVC4::expr::operator<<(std::ostream&, ExprDag);
%ignore CVC4::expr::operator<<(std::ostream&, ExprSetLanguage);

%rename(assign) CVC4::Expr::operator=(const Expr&);
%rename(equals) CVC4::Expr::operator==(const Expr&) const;
%ignore CVC4::Expr::operator!=(const Expr&) const;
%rename(less) CVC4::Expr::operator<(const Expr&) const;
%rename(lessEqual) CVC4::Expr::operator<=(const Expr&) const;
%rename(greater) CVC4::Expr::operator>(const Expr&) const;
%rename(greaterEqual) CVC4::Expr::operator>=(const Expr&) const;

%rename(getChild) CVC4::Expr::operator[](unsigned i) const;
%ignore CVC4::Expr::operator bool() const;// can just use isNull()

namespace CVC4 {
  namespace expr {
    %ignore exportInternal;
  }/* CVC4::expr namespace */
}/* CVC4 namespace */

#ifdef SWIGJAVA

// Instead of Expr::begin() and end(), create an
// iterator() method on the Java side that returns a Java-style
// Iterator.
%ignore CVC4::Expr::begin() const;
%ignore CVC4::Expr::end() const;
%extend CVC4::Expr {
  CVC4::JavaIteratorAdapter<CVC4::Expr> iterator() {
    return CVC4::JavaIteratorAdapter<CVC4::Expr>(*$self);
  }
}

// Expr is "iterable" on the Java side
%typemap(javainterfaces) CVC4::Expr "java.lang.Iterable<edu.nyu.acsys.CVC4.Expr>";

// the JavaIteratorAdapter should not be public, and implements Iterator
%typemap(javaclassmodifiers) CVC4::JavaIteratorAdapter<CVC4::Expr> "class";
%typemap(javainterfaces) CVC4::JavaIteratorAdapter<CVC4::Expr> "java.util.Iterator<edu.nyu.acsys.CVC4.Expr>";
// add some functions to the Java side (do it here because there's no way to do these in C++)
%typemap(javacode) CVC4::JavaIteratorAdapter<CVC4::Expr> "
  public void remove() {
    throw new java.lang.UnsupportedOperationException();
  }

  public edu.nyu.acsys.CVC4.Expr next() {
    if(hasNext()) {
      return getNext();
    } else {
      throw new java.util.NoSuchElementException();
    }
  }
"
// getNext() just allows C++ iterator access from Java-side next(), make it private
%javamethodmodifiers CVC4::JavaIteratorAdapter<CVC4::Expr>::getNext() "private";

// map the types appropriately
%typemap(jni) CVC4::Expr::const_iterator::value_type "jobject";
%typemap(jtype) CVC4::Expr::const_iterator::value_type "edu.nyu.acsys.CVC4.Expr";
%typemap(jstype) CVC4::Expr::const_iterator::value_type "edu.nyu.acsys.CVC4.Expr";
%typemap(javaout) CVC4::Expr::const_iterator::value_type { return $jnicall; }

#endif /* SWIGJAVA */

%include "expr/expr.h"

%template(getConstTypeConstant) CVC4::Expr::getConst<CVC4::TypeConstant>;
%template(getConstArrayStoreAll) CVC4::Expr::getConst<CVC4::ArrayStoreAll>;
%template(getConstBitVectorSize) CVC4::Expr::getConst<CVC4::BitVectorSize>;
%template(getConstAscriptionType) CVC4::Expr::getConst<CVC4::AscriptionType>;
%template(getConstBitVectorBitOf) CVC4::Expr::getConst<CVC4::BitVectorBitOf>;
%template(getConstSubrangeBounds) CVC4::Expr::getConst<CVC4::SubrangeBounds>;
%template(getConstBitVectorRepeat) CVC4::Expr::getConst<CVC4::BitVectorRepeat>;
%template(getConstBitVectorExtract) CVC4::Expr::getConst<CVC4::BitVectorExtract>;
%template(getConstBitVectorRotateLeft) CVC4::Expr::getConst<CVC4::BitVectorRotateLeft>;
%template(getConstBitVectorSignExtend) CVC4::Expr::getConst<CVC4::BitVectorSignExtend>;
%template(getConstBitVectorZeroExtend) CVC4::Expr::getConst<CVC4::BitVectorZeroExtend>;
%template(getConstBitVectorRotateRight) CVC4::Expr::getConst<CVC4::BitVectorRotateRight>;
%template(getConstUninterpretedConstant) CVC4::Expr::getConst<CVC4::UninterpretedConstant>;
%template(getConstKind) CVC4::Expr::getConst<CVC4::kind::Kind_t>;
%template(getConstDatatype) CVC4::Expr::getConst<CVC4::Datatype>;
%template(getConstRational) CVC4::Expr::getConst<CVC4::Rational>;
%template(getConstBitVector) CVC4::Expr::getConst<CVC4::BitVector>;
%template(getConstPredicate) CVC4::Expr::getConst<CVC4::Predicate>;
%template(getConstString) CVC4::Expr::getConst<std::string>;
%template(getConstBoolean) CVC4::Expr::getConst<bool>;

#ifdef SWIGJAVA

%include "bindings/java_iterator_adapter.h"
%include "bindings/java_stream_adapters.h"

%template(JavaIteratorAdapter_Expr) CVC4::JavaIteratorAdapter<CVC4::Expr>;

#endif /* SWIGJAVA */

%include "expr/expr.h"
