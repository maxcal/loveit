module LinksHelper
  def link_to_destroy(record, text = 'Delete', **kwargs)
    if policy(record).destroy?
      link_to text, record,
        { class: 'warning button', method: :delete }.merge(kwargs)
    end
  end

  def link_to_edit(record, text = 'Edit', **kwargs)
    if policy(record).update?
      link_to text, edit_polymorphic_path(record),
        { class: 'button' }.merge(kwargs)
    end
  end
end
