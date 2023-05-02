using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Legends_Barber_API.Models;

public partial class LegendsBarbershopDbContext : DbContext
{
    public LegendsBarbershopDbContext()
    {
    }

    public LegendsBarbershopDbContext(DbContextOptions<LegendsBarbershopDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Booking> Bookings { get; set; }

    public virtual DbSet<List> Lists { get; set; }

    public virtual DbSet<Person> People { get; set; }

    public virtual DbSet<Province> Provinces { get; set; }

    public virtual DbSet<Shop> Shops { get; set; }

    public virtual DbSet<UserType> UserTypes { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=APHRODITE\\SQLEXPRESS;Initial Catalog=Legends_Barbershop_DB;Integrated Security=True;TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Booking>(entity =>
        {
            entity.HasKey(e => e.BookingId).HasName("PK_booking");

            entity.Property(e => e.BookingId).HasColumnName("booking_id");
            entity.Property(e => e.BookingDate)
                .HasColumnType("datetime")
                .HasColumnName("booking_date");
            entity.Property(e => e.PersonId).HasColumnName("person_id");
            entity.Property(e => e.ShopId).HasColumnName("shop_id");

            entity.HasOne(d => d.Person).WithMany(p => p.Bookings)
                .HasForeignKey(d => d.PersonId)
                .HasConstraintName("FK_booking_person");

            entity.HasOne(d => d.Shop).WithMany(p => p.Bookings)
                .HasForeignKey(d => d.ShopId)
                .HasConstraintName("FK_Bookings_Shops");
        });

        modelBuilder.Entity<List>(entity =>
        {
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Date)
                .HasColumnType("datetime")
                .HasColumnName("DATE");
        });

        modelBuilder.Entity<Person>(entity =>
        {
            entity.HasIndex(e => e.Id, "IX_People");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Email)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("email");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("name");
            entity.Property(e => e.Password)
                .IsUnicode(false)
                .HasColumnName("password");
            entity.Property(e => e.PhoneNumber)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("phone_number");
            entity.Property(e => e.Surname)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("surname");
            entity.Property(e => e.UserType).HasColumnName("user_type");
            entity.Property(e => e.Username)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("username");

            entity.HasOne(d => d.UserTypeNavigation).WithMany(p => p.People)
                .HasForeignKey(d => d.UserType)
                .HasConstraintName("FK_People_UType");
        });

        modelBuilder.Entity<Province>(entity =>
        {
            entity.HasKey(e => e.ProvId).HasName("PK_Province");

            entity.Property(e => e.ProvId).HasColumnName("prov_id");
            entity.Property(e => e.ProvName)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("prov_name");
        });

        modelBuilder.Entity<Shop>(entity =>
        {
            entity.HasKey(e => e.ShopId)
                .HasName("PK_Shop")
                .IsClustered(false);

            entity.Property(e => e.ShopId).HasColumnName("shop_id");
            entity.Property(e => e.ShopName)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("shop_name");
            entity.Property(e => e.ShopProv).HasColumnName("shop_prov");

            entity.HasOne(d => d.ShopProvNavigation).WithMany(p => p.Shops)
                .HasForeignKey(d => d.ShopProv)
                .HasConstraintName("FK_Shop_province");
        });

        modelBuilder.Entity<UserType>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_user_type");

            entity.ToTable("User_types");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.TypeName)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("type_name");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
