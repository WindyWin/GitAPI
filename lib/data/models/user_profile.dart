class UserProfile {
  List<OneOf>? oneOf;

  UserProfile({this.oneOf});

  UserProfile.fromJson(Map<String, dynamic> json) {
    if (json['oneOf'] != null) {
      oneOf = <OneOf>[];
      json['oneOf'].forEach((v) {
        oneOf!.add(OneOf.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (oneOf != null) {
      data['oneOf'] = oneOf!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OneOf {
  String? title;
  String? description;
  String? type;
  Properties? properties;
  List<String>? required;
  bool? additionalProperties;

  OneOf(
      {this.title,
      this.description,
      this.type,
      this.properties,
      this.required,
      this.additionalProperties});

  OneOf.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    type = json['type'];
    properties = json['properties'] != null
        ? Properties.fromJson(json['properties'])
        : null;
    required = json['required'].cast<String>();
    additionalProperties = json['additionalProperties'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['type'] = type;
    if (properties != null) {
      data['properties'] = properties!.toJson();
    }
    data['required'] = required;
    data['additionalProperties'] = additionalProperties;
    return data;
  }
}

class Properties {
  Login? login;
  Id? id;
  Login? nodeId;
  AvatarUrl? avatarUrl;
  GravatarId? gravatarId;
  AvatarUrl? url;
  AvatarUrl? htmlUrl;
  AvatarUrl? followersUrl;
  Login? followingUrl;
  Login? gistsUrl;
  Login? starredUrl;
  AvatarUrl? subscriptionsUrl;
  AvatarUrl? organizationsUrl;
  AvatarUrl? reposUrl;
  Login? eventsUrl;
  AvatarUrl? receivedEventsUrl;
  Login? type;
  SiteAdmin? siteAdmin;
  SiteAdmin? name;
  GravatarId? company;
  GravatarId? blog;
  GravatarId? location;
  Email? email;
  Hireable? hireable;
  GravatarId? bio;
  GravatarId? twitterUsername;
  Id? publicRepos;
  Id? publicGists;
  Id? followers;
  Id? following;
  AvatarUrl? createdAt;
  AvatarUrl? updatedAt;
  Id? privateGists;
  Id? totalPrivateRepos;
  Id? ownedPrivateRepos;
  Id? diskUsage;
  SiteAdmin? collaborators;
  TwoFactorAuthentication? twoFactorAuthentication;
  Plan? plan;
  SiteAdmin? businessPlus;
  SiteAdmin? ldapDn;

  Properties(
      {this.login,
      this.id,
      this.nodeId,
      this.avatarUrl,
      this.gravatarId,
      this.url,
      this.htmlUrl,
      this.followersUrl,
      this.followingUrl,
      this.gistsUrl,
      this.starredUrl,
      this.subscriptionsUrl,
      this.organizationsUrl,
      this.reposUrl,
      this.eventsUrl,
      this.receivedEventsUrl,
      this.type,
      this.siteAdmin,
      this.name,
      this.company,
      this.blog,
      this.location,
      this.email,
      this.hireable,
      this.bio,
      this.twitterUsername,
      this.publicRepos,
      this.publicGists,
      this.followers,
      this.following,
      this.createdAt,
      this.updatedAt,
      this.privateGists,
      this.totalPrivateRepos,
      this.ownedPrivateRepos,
      this.diskUsage,
      this.collaborators,
      this.twoFactorAuthentication,
      this.plan,
      this.businessPlus,
      this.ldapDn});

  Properties.fromJson(Map<String, dynamic> json) {
    login = json['login'] != null ? Login.fromJson(json['login']) : null;
    id = json['id'] != null ? Id.fromJson(json['id']) : null;
    nodeId = json['node_id'] != null ? Login.fromJson(json['node_id']) : null;
    avatarUrl = json['avatar_url'] != null
        ? AvatarUrl.fromJson(json['avatar_url'])
        : null;
    gravatarId = json['gravatar_id'] != null
        ? GravatarId.fromJson(json['gravatar_id'])
        : null;
    url = json['url'] != null ? AvatarUrl.fromJson(json['url']) : null;
    htmlUrl =
        json['html_url'] != null ? AvatarUrl.fromJson(json['html_url']) : null;
    followersUrl = json['followers_url'] != null
        ? AvatarUrl.fromJson(json['followers_url'])
        : null;
    followingUrl = json['following_url'] != null
        ? Login.fromJson(json['following_url'])
        : null;
    gistsUrl =
        json['gists_url'] != null ? Login.fromJson(json['gists_url']) : null;
    starredUrl = json['starred_url'] != null
        ? Login.fromJson(json['starred_url'])
        : null;
    subscriptionsUrl = json['subscriptions_url'] != null
        ? AvatarUrl.fromJson(json['subscriptions_url'])
        : null;
    organizationsUrl = json['organizations_url'] != null
        ? AvatarUrl.fromJson(json['organizations_url'])
        : null;
    reposUrl = json['repos_url'] != null
        ? AvatarUrl.fromJson(json['repos_url'])
        : null;
    eventsUrl =
        json['events_url'] != null ? Login.fromJson(json['events_url']) : null;
    receivedEventsUrl = json['received_events_url'] != null
        ? AvatarUrl.fromJson(json['received_events_url'])
        : null;
    type = json['type'] != null ? Login.fromJson(json['type']) : null;
    siteAdmin = json['site_admin'] != null
        ? SiteAdmin.fromJson(json['site_admin'])
        : null;
    name = json['name'] != null ? SiteAdmin.fromJson(json['name']) : null;
    company =
        json['company'] != null ? GravatarId.fromJson(json['company']) : null;
    blog = json['blog'] != null ? GravatarId.fromJson(json['blog']) : null;
    location =
        json['location'] != null ? GravatarId.fromJson(json['location']) : null;
    email = json['email'] != null ? Email.fromJson(json['email']) : null;
    hireable =
        json['hireable'] != null ? Hireable.fromJson(json['hireable']) : null;
    bio = json['bio'] != null ? GravatarId.fromJson(json['bio']) : null;
    twitterUsername = json['twitter_username'] != null
        ? GravatarId.fromJson(json['twitter_username'])
        : null;
    publicRepos =
        json['public_repos'] != null ? Id.fromJson(json['public_repos']) : null;
    publicGists =
        json['public_gists'] != null ? Id.fromJson(json['public_gists']) : null;
    followers =
        json['followers'] != null ? Id.fromJson(json['followers']) : null;
    following =
        json['following'] != null ? Id.fromJson(json['following']) : null;
    createdAt = json['created_at'] != null
        ? AvatarUrl.fromJson(json['created_at'])
        : null;
    updatedAt = json['updated_at'] != null
        ? AvatarUrl.fromJson(json['updated_at'])
        : null;
    privateGists = json['private_gists'] != null
        ? Id.fromJson(json['private_gists'])
        : null;
    totalPrivateRepos = json['total_private_repos'] != null
        ? Id.fromJson(json['total_private_repos'])
        : null;
    ownedPrivateRepos = json['owned_private_repos'] != null
        ? Id.fromJson(json['owned_private_repos'])
        : null;
    diskUsage =
        json['disk_usage'] != null ? Id.fromJson(json['disk_usage']) : null;
    collaborators = json['collaborators'] != null
        ? SiteAdmin.fromJson(json['collaborators'])
        : null;
    twoFactorAuthentication = json['two_factor_authentication'] != null
        ? TwoFactorAuthentication.fromJson(json['two_factor_authentication'])
        : null;
    plan = json['plan'] != null ? Plan.fromJson(json['plan']) : null;

    businessPlus = json['business_plus'] != null
        ? SiteAdmin.fromJson(json['business_plus'])
        : null;
    ldapDn =
        json['ldap_dn'] != null ? SiteAdmin.fromJson(json['ldap_dn']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (login != null) {
      data['login'] = login!.toJson();
    }
    if (id != null) {
      data['id'] = id!.toJson();
    }
    if (nodeId != null) {
      data['node_id'] = nodeId!.toJson();
    }
    if (avatarUrl != null) {
      data['avatar_url'] = avatarUrl!.toJson();
    }
    if (gravatarId != null) {
      data['gravatar_id'] = gravatarId!.toJson();
    }
    if (url != null) {
      data['url'] = url!.toJson();
    }
    if (htmlUrl != null) {
      data['html_url'] = htmlUrl!.toJson();
    }
    if (followersUrl != null) {
      data['followers_url'] = followersUrl!.toJson();
    }
    if (followingUrl != null) {
      data['following_url'] = followingUrl!.toJson();
    }
    if (gistsUrl != null) {
      data['gists_url'] = gistsUrl!.toJson();
    }
    if (starredUrl != null) {
      data['starred_url'] = starredUrl!.toJson();
    }
    if (subscriptionsUrl != null) {
      data['subscriptions_url'] = subscriptionsUrl!.toJson();
    }
    if (organizationsUrl != null) {
      data['organizations_url'] = organizationsUrl!.toJson();
    }
    if (reposUrl != null) {
      data['repos_url'] = reposUrl!.toJson();
    }
    if (eventsUrl != null) {
      data['events_url'] = eventsUrl!.toJson();
    }
    if (receivedEventsUrl != null) {
      data['received_events_url'] = receivedEventsUrl!.toJson();
    }
    if (type != null) {
      data['type'] = type!.toJson();
    }
    if (siteAdmin != null) {
      data['site_admin'] = siteAdmin!.toJson();
    }
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (company != null) {
      data['company'] = company!.toJson();
    }
    if (blog != null) {
      data['blog'] = blog!.toJson();
    }
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (email != null) {
      data['email'] = email!.toJson();
    }
    if (hireable != null) {
      data['hireable'] = hireable!.toJson();
    }
    if (bio != null) {
      data['bio'] = bio!.toJson();
    }
    if (twitterUsername != null) {
      data['twitter_username'] = twitterUsername!.toJson();
    }
    if (publicRepos != null) {
      data['public_repos'] = publicRepos!.toJson();
    }
    if (publicGists != null) {
      data['public_gists'] = publicGists!.toJson();
    }
    if (followers != null) {
      data['followers'] = followers!.toJson();
    }
    if (following != null) {
      data['following'] = following!.toJson();
    }
    if (createdAt != null) {
      data['created_at'] = createdAt!.toJson();
    }
    if (updatedAt != null) {
      data['updated_at'] = updatedAt!.toJson();
    }
    if (privateGists != null) {
      data['private_gists'] = privateGists!.toJson();
    }
    if (totalPrivateRepos != null) {
      data['total_private_repos'] = totalPrivateRepos!.toJson();
    }
    if (ownedPrivateRepos != null) {
      data['owned_private_repos'] = ownedPrivateRepos!.toJson();
    }
    if (diskUsage != null) {
      data['disk_usage'] = diskUsage!.toJson();
    }
    if (collaborators != null) {
      data['collaborators'] = collaborators!.toJson();
    }
    if (twoFactorAuthentication != null) {
      data['two_factor_authentication'] = twoFactorAuthentication!.toJson();
    }
    if (plan != null) {
      data['plan'] = plan!.toJson();
    }

    if (businessPlus != null) {
      data['business_plus'] = businessPlus!.toJson();
    }
    if (ldapDn != null) {
      data['ldap_dn'] = ldapDn!.toJson();
    }
    return data;
  }
}

class Login {
  String? type;
  List<String>? examples;

  Login({this.type, this.examples});

  Login.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    examples = json['examples'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['examples'] = examples;
    return data;
  }
}

class Id {
  String? type;
  List<int>? examples;

  Id({this.type, this.examples});

  Id.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    examples = json['examples'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['examples'] = examples;
    return data;
  }
}

class AvatarUrl {
  String? type;
  String? format;
  List<String>? examples;

  AvatarUrl({this.type, this.format, this.examples});

  AvatarUrl.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    format = json['format'];
    examples = json['examples'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['format'] = format;
    data['examples'] = examples;
    return data;
  }
}

class GravatarId {
  List<String>? type;
  List<String>? examples;

  GravatarId({this.type, this.examples});

  GravatarId.fromJson(Map<String, dynamic> json) {
    type = json['type'].cast<String>();
    examples = json['examples'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['examples'] = examples;
    return data;
  }
}

class SiteAdmin {
  String? type;

  SiteAdmin({this.type});

  SiteAdmin.fromJson(Map<String, dynamic> json) {
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    return data;
  }
}

class Email {
  List<String>? type;
  String? format;
  List<String>? examples;

  Email({this.type, this.format, this.examples});

  Email.fromJson(Map<String, dynamic> json) {
    type = json['type'].cast<String>();
    format = json['format'];
    examples = json['examples'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['format'] = format;
    data['examples'] = examples;
    return data;
  }
}

class Hireable {
  List<String>? type;

  Hireable({this.type});

  Hireable.fromJson(Map<String, dynamic> json) {
    type = json['type'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    return data;
  }
}

class TwoFactorAuthentication {
  String? type;
  List<bool>? examples;

  TwoFactorAuthentication({this.type, this.examples});

  TwoFactorAuthentication.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    examples = json['examples'].cast<bool>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['examples'] = examples;
    return data;
  }
}

class Plan {
  String? type;
  Properties? properties;
  List<String>? required;

  Plan({this.type, this.properties, this.required});

  Plan.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    properties = json['properties'] != null
        ? Properties.fromJson(json['properties'])
        : null;
    required = json['required'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (properties != null) {
      data['properties'] = properties!.toJson();
    }
    data['required'] = required;
    return data;
  }
}
