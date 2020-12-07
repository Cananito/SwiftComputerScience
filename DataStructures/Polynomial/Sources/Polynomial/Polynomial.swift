public typealias Coefficient = Int
private typealias CoefficientGroupedTerms = [Coefficient: Term]

public struct Term : CustomStringConvertible, CustomDebugStringConvertible {
  public let constant: Int
  public let coefficient: Coefficient

  public init(constant: Int, coefficient: Coefficient) {
    self.constant = constant
    self.coefficient = coefficient
  }

  // MARK: CustomStringConvertible

  public var description: String {
    if coefficient == 0 {
      return "\(constant)"
    } else if coefficient == 1 {
      return "\(constant)x"
    }
    return "\(constant)x^\(coefficient)"
  }

  // MARK: CustomDebugStringConvertible

  public var debugDescription: String {
    return description
  }
}

public struct Polynomial : CustomStringConvertible, CustomDebugStringConvertible {
  public let terms: [Term]

  public init(terms: [Term]) {
    self.terms = terms
  }

  public func termForCoefficient(_ coefficient: Int) -> Term? {
    for term in terms {
      if term.coefficient == coefficient {
        return term
      }
    }
    return nil
  }

  public func derived() -> Polynomial {
    let terms = self.simplified().terms.sorted { $0.coefficient > $1.coefficient }

    var derivedTerms = [Term]()
    for term in terms {
      if term.coefficient == 0 {
        continue
      }

      let newConstant = term.constant * term.coefficient
      let newCoefficient = term.coefficient - 1
      let newTerm = Term(constant: newConstant, coefficient: newCoefficient)
      derivedTerms.append(newTerm)
    }

    return Polynomial(terms: derivedTerms)
  }

  public func simplified() -> Polynomial {
    var simplifiedTerms = [Term]()
    for (_, value) in coefficientGroupedTerms(terms) {
      let term = Term(constant: value.constant, coefficient: value.coefficient)
      simplifiedTerms.append(term)
    }
    return Polynomial(terms: simplifiedTerms)
  }

  // MARK: CustomStringConvertible

  public var description: String {
    return terms.map { $0.description }.joined(separator: ", ")
  }

  // MARK: CustomDebugStringConvertible

  public var debugDescription: String {
    return description
  }
}

private func coefficientGroupedTerms(_ terms: [Term]) -> CoefficientGroupedTerms {
  var coefficientGroupedTerms = CoefficientGroupedTerms()
  for term in terms {
    if let existingTerm = coefficientGroupedTerms[term.coefficient] {
      let newConstant = existingTerm.constant + term.constant
      coefficientGroupedTerms[term.coefficient] = Term(constant: newConstant, coefficient: term.coefficient)
    } else {
      coefficientGroupedTerms[term.coefficient] = term
    }
  }
  return coefficientGroupedTerms
}
