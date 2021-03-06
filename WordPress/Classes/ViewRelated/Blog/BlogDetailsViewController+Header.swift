import Gridicons

extension BlogDetailsViewController {
    @objc func configureHeaderView() -> NewBlogDetailHeaderView {
        let headerView = NewBlogDetailHeaderView(items: [
            ActionRow.Item(image: Gridicon.iconOfType(.statsAlt), title: NSLocalizedString("Stats", comment: "Noun. Abbv. of Statistics. Links to a blog's Stats screen.")) { [weak self] in
                self?.tableView.deselectSelectedRowWithAnimation(false)
                self?.showStats()
            },
            ActionRow.Item(image: Gridicon.iconOfType(.pages), title: NSLocalizedString("Pages", comment: "Noun. Title. Links to the blog's Pages screen.")) { [weak self] in
                self?.tableView.deselectSelectedRowWithAnimation(false)
                self?.showPageList()
            },
            ActionRow.Item(image: Gridicon.iconOfType(.posts), title: NSLocalizedString("Posts", comment: "Noun. Title. Links to the blog's Posts screen.")) { [weak self] in
                self?.tableView.deselectSelectedRowWithAnimation(false)
                self?.showPostList()
            },
            ActionRow.Item(image: Gridicon.iconOfType(.image), title: NSLocalizedString("Media", comment: "Noun. Title. Links to the blog's Media library.")) { [weak self] in
                self?.tableView.deselectSelectedRowWithAnimation(false)
                self?.showMediaLibrary()
            }
        ])
        return headerView
    }
}

/// A protocol to temporarily share implementations between `BlogDetailHeaderView` and `NewBlogDetailHeaderView`
@objc protocol BlogDetailHeader where Self: UIView {
    var blog: Blog? { get set }
    var updatingIcon: Bool { get set }
    @objc var blavatarImageView: UIImageView { get }
    func refreshIconImage()
}

extension NewBlogDetailHeaderView: BlogDetailHeader {
}

extension BlogDetailHeaderView: BlogDetailHeader {
}
