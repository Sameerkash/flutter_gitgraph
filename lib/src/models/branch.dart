import 'commit.dart';

/// Represnts a Branch in a workflow
/// Each branch can have multiple commits
class Branch {
  /// An id can be provided to make a link between two branches.
  /// Eihter when a new branch is created or when brannch is merged.
  final String id;

  /// Represents the name give to a branch.
  /// The name property will be displayed along side each branch
  final String name;

  /// A list of commits to be displayed along the branch.
  /// [Commit] is repesented by by a circle on the branch.
  final List<Commit> commits;
  Branch({
    this.name,
    this.id,
    this.commits,
  });
}
